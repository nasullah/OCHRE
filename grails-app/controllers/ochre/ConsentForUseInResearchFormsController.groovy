package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ConsentForUseInResearchFormsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConsentForUseInResearchForms.list(params), model:[consentForUseInResearchFormsCount: ConsentForUseInResearchForms.count()]
    }

    def show(ConsentForUseInResearchForms consentForUseInResearchForms) {
        respond consentForUseInResearchForms
    }

    def create() {
        respond new ConsentForUseInResearchForms(params)
    }

    @Transactional
    def save(ConsentForUseInResearchForms consentForUseInResearchForms) {
        if (consentForUseInResearchForms == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (consentForUseInResearchForms.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond consentForUseInResearchForms.errors, view:'create'
            return
        }

        consentForUseInResearchForms.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consentForUseInResearchForms.label', default: 'ConsentForUseInResearchForms'), consentForUseInResearchForms.id])
                redirect consentForUseInResearchForms
            }
            '*' { respond consentForUseInResearchForms, [status: CREATED] }
        }
    }

    def edit(ConsentForUseInResearchForms consentForUseInResearchForms) {
        respond consentForUseInResearchForms
    }

    @Transactional
    def update(ConsentForUseInResearchForms consentForUseInResearchForms) {
        if (consentForUseInResearchForms == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (consentForUseInResearchForms.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond consentForUseInResearchForms.errors, view:'edit'
            return
        }

        consentForUseInResearchForms.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'consentForUseInResearchForms.label', default: 'ConsentForUseInResearchForms'), consentForUseInResearchForms.id])
                redirect consentForUseInResearchForms
            }
            '*'{ respond consentForUseInResearchForms, [status: OK] }
        }
    }

    @Transactional
    def delete(ConsentForUseInResearchForms consentForUseInResearchForms) {

        if (consentForUseInResearchForms == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        consentForUseInResearchForms.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'consentForUseInResearchForms.label', default: 'ConsentForUseInResearchForms'), consentForUseInResearchForms.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consentForUseInResearchForms.label', default: 'ConsentForUseInResearchForms'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
