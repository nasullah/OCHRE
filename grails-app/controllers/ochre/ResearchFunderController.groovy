package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ResearchFunderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ResearchFunder.list(params), model:[researchFunderCount: ResearchFunder.count()]
    }

    def show(ResearchFunder researchFunder) {
        respond researchFunder
    }

    def create() {
        respond new ResearchFunder(params)
    }

    @Transactional
    def save(ResearchFunder researchFunder) {
        if (researchFunder == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (researchFunder.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond researchFunder.errors, view:'create'
            return
        }

        researchFunder.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'researchFunder.label', default: 'ResearchFunder'), researchFunder.id])
                redirect researchFunder
            }
            '*' { respond researchFunder, [status: CREATED] }
        }
    }

    def edit(ResearchFunder researchFunder) {
        respond researchFunder
    }

    @Transactional
    def update(ResearchFunder researchFunder) {
        if (researchFunder == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (researchFunder.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond researchFunder.errors, view:'edit'
            return
        }

        researchFunder.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'researchFunder.label', default: 'ResearchFunder'), researchFunder.id])
                redirect researchFunder
            }
            '*'{ respond researchFunder, [status: OK] }
        }
    }

    @Transactional
    def delete(ResearchFunder researchFunder) {

        if (researchFunder == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        researchFunder.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'researchFunder.label', default: 'ResearchFunder'), researchFunder.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'researchFunder.label', default: 'ResearchFunder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
