package ochre

import grails.test.mixin.*
import spock.lang.*

@TestFor(EthicalApprovalLetterController)
@Mock(EthicalApprovalLetter)
class EthicalApprovalLetterControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.ethicalApprovalLetterList
            model.ethicalApprovalLetterCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.ethicalApprovalLetter!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def ethicalApprovalLetter = new EthicalApprovalLetter()
            ethicalApprovalLetter.validate()
            controller.save(ethicalApprovalLetter)

        then:"The create view is rendered again with the correct model"
            model.ethicalApprovalLetter!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            ethicalApprovalLetter = new EthicalApprovalLetter(params)

            controller.save(ethicalApprovalLetter)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/ethicalApprovalLetter/show/1'
            controller.flash.message != null
            EthicalApprovalLetter.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def ethicalApprovalLetter = new EthicalApprovalLetter(params)
            controller.show(ethicalApprovalLetter)

        then:"A model is populated containing the domain instance"
            model.ethicalApprovalLetter == ethicalApprovalLetter
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def ethicalApprovalLetter = new EthicalApprovalLetter(params)
            controller.edit(ethicalApprovalLetter)

        then:"A model is populated containing the domain instance"
            model.ethicalApprovalLetter == ethicalApprovalLetter
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/ethicalApprovalLetter/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def ethicalApprovalLetter = new EthicalApprovalLetter()
            ethicalApprovalLetter.validate()
            controller.update(ethicalApprovalLetter)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.ethicalApprovalLetter == ethicalApprovalLetter

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            ethicalApprovalLetter = new EthicalApprovalLetter(params).save(flush: true)
            controller.update(ethicalApprovalLetter)

        then:"A redirect is issued to the show action"
            ethicalApprovalLetter != null
            response.redirectedUrl == "/ethicalApprovalLetter/show/$ethicalApprovalLetter.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/ethicalApprovalLetter/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def ethicalApprovalLetter = new EthicalApprovalLetter(params).save(flush: true)

        then:"It exists"
            EthicalApprovalLetter.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(ethicalApprovalLetter)

        then:"The instance is deleted"
            EthicalApprovalLetter.count() == 0
            response.redirectedUrl == '/ethicalApprovalLetter/index'
            flash.message != null
    }
}
