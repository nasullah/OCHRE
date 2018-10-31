package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ApplicationTypeController {

    def mailService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationType.list(params), model:[applicationTypeCount: ApplicationType.count()]
    }

    def show(ApplicationType applicationType) {
        respond applicationType
    }

    def create() {
        respond new ApplicationType(params)
    }

    def test = {
        // create user

        mailService.sendMail {
            from "nasullah.khalidalham@eng.ox.ac.uk"
            to "nasullah.khalidalham@eng.ox.ac.uk"
            subject "New user"
            text "A new user has been created"
        }

        redirect action:"index", method:"GET"
    }


    @Transactional
    def save(ApplicationType applicationType) {
        if (applicationType == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicationType.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicationType.errors, view:'create'
            return
        }

        applicationType.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicationType.label', default: 'ApplicationType'), applicationType.id])
                redirect applicationType
            }
            '*' { respond applicationType, [status: CREATED] }
        }
    }

    def edit(ApplicationType applicationType) {
        respond applicationType
    }

    @Transactional
    def update(ApplicationType applicationType) {
        if (applicationType == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (applicationType.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond applicationType.errors, view:'edit'
            return
        }

        applicationType.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'applicationType.label', default: 'ApplicationType'), applicationType.id])
                redirect applicationType
            }
            '*'{ respond applicationType, [status: OK] }
        }
    }

    @Transactional
    def delete(ApplicationType applicationType) {

        if (applicationType == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        applicationType.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicationType.label', default: 'ApplicationType'), applicationType.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationType.label', default: 'ApplicationType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
