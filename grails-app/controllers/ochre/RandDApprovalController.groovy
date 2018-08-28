package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RandDApprovalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RandDApproval.list(params), model:[randDApprovalCount: RandDApproval.count()]
    }

    def show(RandDApproval randDApproval) {
        respond randDApproval
    }

    def create() {
        respond new RandDApproval(params)
    }

    @Transactional
    def save(RandDApproval randDApproval) {
        if (randDApproval == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (randDApproval.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond randDApproval.errors, view:'create'
            return
        }

        randDApproval.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'randDApproval.label', default: 'RandDApproval'), randDApproval.id])
                redirect randDApproval
            }
            '*' { respond randDApproval, [status: CREATED] }
        }
    }

    def edit(RandDApproval randDApproval) {
        respond randDApproval
    }

    @Transactional
    def update(RandDApproval randDApproval) {
        if (randDApproval == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (randDApproval.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond randDApproval.errors, view:'edit'
            return
        }

        randDApproval.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'randDApproval.label', default: 'RandDApproval'), randDApproval.id])
                redirect randDApproval
            }
            '*'{ respond randDApproval, [status: OK] }
        }
    }

    @Transactional
    def delete(RandDApproval randDApproval) {

        if (randDApproval == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        randDApproval.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'randDApproval.label', default: 'RandDApproval'), randDApproval.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'randDApproval.label', default: 'RandDApproval'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
