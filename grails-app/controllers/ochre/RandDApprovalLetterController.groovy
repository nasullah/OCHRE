package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class RandDApprovalLetterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RandDApprovalLetter.list(params), model:[randDApprovalLetterCount: RandDApprovalLetter.count()]
    }

    def show(RandDApprovalLetter randDApprovalLetter) {
        respond randDApprovalLetter
    }

    def create() {
        respond new RandDApprovalLetter(params)
    }

    @Transactional
    def save(RandDApprovalLetter randDApprovalLetter) {
        if (randDApprovalLetter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (randDApprovalLetter.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond randDApprovalLetter.errors, view:'create'
            return
        }

        randDApprovalLetter.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'randDApprovalLetter.label', default: 'RandDApprovalLetter'), randDApprovalLetter.id])
                redirect randDApprovalLetter
            }
            '*' { respond randDApprovalLetter, [status: CREATED] }
        }
    }

    def edit(RandDApprovalLetter randDApprovalLetter) {
        respond randDApprovalLetter
    }

    @Transactional
    def update(RandDApprovalLetter randDApprovalLetter) {
        if (randDApprovalLetter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (randDApprovalLetter.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond randDApprovalLetter.errors, view:'edit'
            return
        }

        randDApprovalLetter.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'randDApprovalLetter.label', default: 'RandDApprovalLetter'), randDApprovalLetter.id])
                redirect randDApprovalLetter
            }
            '*'{ respond randDApprovalLetter, [status: OK] }
        }
    }

    @Transactional
    def delete(RandDApprovalLetter randDApprovalLetter) {

        if (randDApprovalLetter == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        randDApprovalLetter.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'randDApprovalLetter.label', default: 'RandDApprovalLetter'), randDApprovalLetter.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'randDApprovalLetter.label', default: 'RandDApprovalLetter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
