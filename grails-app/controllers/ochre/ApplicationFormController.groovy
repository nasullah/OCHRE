package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])

@Transactional(readOnly = true)
class ApplicationFormController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationForm.list(params), model:[applicationFormCount: ApplicationForm.count()]
    }

    def show(ApplicationForm applicationForm) {
        respond applicationForm
    }

    def create() {
        respond new ApplicationForm(params)
    }

    @Transactional
    def save(ApplicationForm applicationForm) {
        if (applicationForm == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicationForm.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicationForm.errors, view:'create'
            return
        }

        applicationForm.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationForm.id])
                redirect applicationForm
            }
            '*' { respond applicationForm, [status: CREATED] }
        }
    }

    def edit(ApplicationForm applicationForm) {
        respond applicationForm
    }

    @Transactional
    def update(ApplicationForm applicationForm) {
        if (applicationForm == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicationForm.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicationForm.errors, view:'edit'
            return
        }

        applicationForm.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationForm.id])
                redirect applicationForm
            }
            '*'{ respond applicationForm, [status: OK] }
        }
    }

    @Transactional
    def delete(ApplicationForm applicationForm) {

        if (applicationForm == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        applicationForm.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationForm.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
