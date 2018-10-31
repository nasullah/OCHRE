package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class MTAOrCTAController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MTAOrCTA.list(params), model:[MTAOrCTACount: MTAOrCTA.count()]
    }

    def show(MTAOrCTA MTAOrCTA) {
        respond MTAOrCTA
    }

    def create() {
        respond new MTAOrCTA(params)
    }

    @Transactional
    def save(MTAOrCTA MTAOrCTA) {
        if (MTAOrCTA == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (MTAOrCTA.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond MTAOrCTA.errors, view:'create'
            return
        }

        MTAOrCTA.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'MTAOrCTA.label', default: 'MTAOrCTA'), MTAOrCTA.id])
                redirect MTAOrCTA
            }
            '*' { respond MTAOrCTA, [status: CREATED] }
        }
    }

    def edit(MTAOrCTA MTAOrCTA) {
        respond MTAOrCTA
    }

    @Transactional
    def update(MTAOrCTA MTAOrCTA) {
        if (MTAOrCTA == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (MTAOrCTA.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond MTAOrCTA.errors, view:'edit'
            return
        }

        MTAOrCTA.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MTAOrCTA.label', default: 'MTAOrCTA'), MTAOrCTA.id])
                redirect MTAOrCTA
            }
            '*'{ respond MTAOrCTA, [status: OK] }
        }
    }

    @Transactional
    def delete(MTAOrCTA MTAOrCTA) {

        if (MTAOrCTA == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        MTAOrCTA.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MTAOrCTA.label', default: 'MTAOrCTA'), MTAOrCTA.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'MTAOrCTA.label', default: 'MTAOrCTA'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
