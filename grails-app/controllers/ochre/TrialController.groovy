package ochre

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TrialController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Trial.list(params), model:[trialCount: Trial.count()]
    }

    def show(Trial trial) {
        respond trial
    }

    def create() {
        respond new Trial(params)
    }

    @Transactional
    def save(Trial trial) {
        if (trial == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (trial.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond trial.errors, view:'create'
            return
        }

        trial.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'trial.label', default: 'Trial'), trial.id])
                redirect trial
            }
            '*' { respond trial, [status: CREATED] }
        }
    }

    def edit(Trial trial) {
        respond trial
    }

    @Transactional
    def update(Trial trial) {
        if (trial == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (trial.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond trial.errors, view:'edit'
            return
        }

        trial.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'trial.label', default: 'Trial'), trial.id])
                redirect trial
            }
            '*'{ respond trial, [status: OK] }
        }
    }

    @Transactional
    def delete(Trial trial) {

        if (trial == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        trial.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'trial.label', default: 'Trial'), trial.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'trial.label', default: 'Trial'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
