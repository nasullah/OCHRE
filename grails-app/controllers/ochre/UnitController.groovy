package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class UnitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Unit.list(params), model:[unitCount: Unit.count()]
    }

    def show(Unit unit) {
        respond unit
    }

    def create() {
        respond new Unit(params)
    }

    @Transactional
    def save(Unit unit) {
        if (unit == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (unit.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond unit.errors, view:'create'
            return
        }

        unit.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'unit.label', default: 'Unit'), unit.id])
                redirect unit
            }
            '*' { respond unit, [status: CREATED] }
        }
    }

    def edit(Unit unit) {
        respond unit
    }

    @Transactional
    def update(Unit unit) {
        if (unit == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (unit.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond unit.errors, view:'edit'
            return
        }

        unit.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'unit.label', default: 'Unit'), unit.id])
                redirect unit
            }
            '*'{ respond unit, [status: OK] }
        }
    }

    @Transactional
    def delete(Unit unit) {

        if (unit == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        unit.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'unit.label', default: 'Unit'), unit.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'unit.label', default: 'Unit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
