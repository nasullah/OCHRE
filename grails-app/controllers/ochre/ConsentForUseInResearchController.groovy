package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ConsentForUseInResearchController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConsentForUseInResearch.list(params), model:[consentForUseInResearchCount: ConsentForUseInResearch.count()]
    }

    def show(ConsentForUseInResearch consentForUseInResearch) {
        respond consentForUseInResearch
    }

    def create() {
        respond new ConsentForUseInResearch(params)
    }

    @Transactional
    def save(ConsentForUseInResearch consentForUseInResearch) {
        if (consentForUseInResearch == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (consentForUseInResearch.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond consentForUseInResearch.errors, view:'create'
            return
        }

        consentForUseInResearch.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consentForUseInResearch.label', default: 'ConsentForUseInResearch'), consentForUseInResearch.id])
                redirect consentForUseInResearch
            }
            '*' { respond consentForUseInResearch, [status: CREATED] }
        }
    }

    def edit(ConsentForUseInResearch consentForUseInResearch) {
        respond consentForUseInResearch
    }

    @Transactional
    def update(ConsentForUseInResearch consentForUseInResearch) {
        if (consentForUseInResearch == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (consentForUseInResearch.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond consentForUseInResearch.errors, view:'edit'
            return
        }

        consentForUseInResearch.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'consentForUseInResearch.label', default: 'ConsentForUseInResearch'), consentForUseInResearch.id])
                redirect consentForUseInResearch
            }
            '*'{ respond consentForUseInResearch, [status: OK] }
        }
    }

    @Transactional
    def delete(ConsentForUseInResearch consentForUseInResearch) {

        if (consentForUseInResearch == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        consentForUseInResearch.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'consentForUseInResearch.label', default: 'ConsentForUseInResearch'), consentForUseInResearch.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consentForUseInResearch.label', default: 'ConsentForUseInResearch'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
