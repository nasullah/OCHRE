package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EthicalApprovalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EthicalApproval.list(params), model:[ethicalApprovalCount: EthicalApproval.count()]
    }

    def show(EthicalApproval ethicalApproval) {
        respond ethicalApproval
    }

    def create() {
        respond new EthicalApproval(params)
    }

    @Transactional
    def save(EthicalApproval ethicalApproval) {
        if (ethicalApproval == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (ethicalApproval.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond ethicalApproval.errors, view:'create'
            return
        }

        ethicalApproval.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ethicalApproval.label', default: 'EthicalApproval'), ethicalApproval.id])
                redirect ethicalApproval
            }
            '*' { respond ethicalApproval, [status: CREATED] }
        }
    }

    def edit(EthicalApproval ethicalApproval) {
        respond ethicalApproval
    }

    @Transactional
    def update(EthicalApproval ethicalApproval) {
        if (ethicalApproval == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (ethicalApproval.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond ethicalApproval.errors, view:'edit'
            return
        }

        ethicalApproval.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ethicalApproval.label', default: 'EthicalApproval'), ethicalApproval.id])
                redirect ethicalApproval
            }
            '*'{ respond ethicalApproval, [status: OK] }
        }
    }

    @Transactional
    def delete(EthicalApproval ethicalApproval) {

        if (ethicalApproval == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        ethicalApproval.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ethicalApproval.label', default: 'EthicalApproval'), ethicalApproval.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ethicalApproval.label', default: 'EthicalApproval'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
