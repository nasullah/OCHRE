package ochre

class Person {

    static mapping = {
        jobTitle type: "text"
        emailAddress type: "text"
        telephoneNumber type: "text"
        workAddress type: "text"
    }
    static auditable = true
    static constraints = {
        name()
        jobTitle()
        workAddress widget: 'textarea'
        telephoneNumber()
        emailAddress()
    }

    String name
    String jobTitle
    String workAddress
    String telephoneNumber
    String emailAddress

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}";
    }
}
