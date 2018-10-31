package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class CopyOfMTAOrCTAController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CopyOfMTAOrCTA.list(params), model:[copyOfMTAOrCTACount: CopyOfMTAOrCTA.count()]
    }

    def show(CopyOfMTAOrCTA copyOfMTAOrCTA) {
        respond copyOfMTAOrCTA
    }

    def create() {
        respond new CopyOfMTAOrCTA(params)
    }

    @Transactional
    def save(CopyOfMTAOrCTA copyOfMTAOrCTA) {
        if (copyOfMTAOrCTA == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (copyOfMTAOrCTA.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond copyOfMTAOrCTA.errors, view:'create'
            return
        }

        copyOfMTAOrCTA.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'copyOfMTAOrCTA.label', default: 'CopyOfMTAOrCTA'), copyOfMTAOrCTA.id])
                redirect copyOfMTAOrCTA
            }
            '*' { respond copyOfMTAOrCTA, [status: CREATED] }
        }
    }

    def edit(CopyOfMTAOrCTA copyOfMTAOrCTA) {
        respond copyOfMTAOrCTA
    }

    @Transactional
    def update(CopyOfMTAOrCTA copyOfMTAOrCTA) {
        if (copyOfMTAOrCTA == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (copyOfMTAOrCTA.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond copyOfMTAOrCTA.errors, view:'edit'
            return
        }

        copyOfMTAOrCTA.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'copyOfMTAOrCTA.label', default: 'CopyOfMTAOrCTA'), copyOfMTAOrCTA.id])
                redirect copyOfMTAOrCTA
            }
            '*'{ respond copyOfMTAOrCTA, [status: OK] }
        }
    }

    @Transactional
    def delete(CopyOfMTAOrCTA copyOfMTAOrCTA) {

        if (copyOfMTAOrCTA == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        copyOfMTAOrCTA.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'copyOfMTAOrCTA.label', default: 'CopyOfMTAOrCTA'), copyOfMTAOrCTA.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'copyOfMTAOrCTA.label', default: 'CopyOfMTAOrCTA'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
