package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class EthicalApprovalLetterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EthicalApprovalLetter.list(params), model:[ethicalApprovalLetterCount: EthicalApprovalLetter.count()]
    }

    def show(EthicalApprovalLetter ethicalApprovalLetter) {
        respond ethicalApprovalLetter
    }

    def create() {
        respond new EthicalApprovalLetter(params)
    }

    @Transactional
    def save(EthicalApprovalLetter ethicalApprovalLetter) {
        if (ethicalApprovalLetter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (ethicalApprovalLetter.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond ethicalApprovalLetter.errors, view:'create'
            return
        }

        ethicalApprovalLetter.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ethicalApprovalLetter.label', default: 'EthicalApprovalLetter'), ethicalApprovalLetter.id])
                redirect ethicalApprovalLetter
            }
            '*' { respond ethicalApprovalLetter, [status: CREATED] }
        }
    }

    def edit(EthicalApprovalLetter ethicalApprovalLetter) {
        respond ethicalApprovalLetter
    }

    @Transactional
    def update(EthicalApprovalLetter ethicalApprovalLetter) {
        if (ethicalApprovalLetter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (ethicalApprovalLetter.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond ethicalApprovalLetter.errors, view:'edit'
            return
        }

        ethicalApprovalLetter.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ethicalApprovalLetter.label', default: 'EthicalApprovalLetter'), ethicalApprovalLetter.id])
                redirect ethicalApprovalLetter
            }
            '*'{ respond ethicalApprovalLetter, [status: OK] }
        }
    }

    @Transactional
    def delete(EthicalApprovalLetter ethicalApprovalLetter) {

        if (ethicalApprovalLetter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        ethicalApprovalLetter.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ethicalApprovalLetter.label', default: 'EthicalApprovalLetter'), ethicalApprovalLetter.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ethicalApprovalLetter.label', default: 'EthicalApprovalLetter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
