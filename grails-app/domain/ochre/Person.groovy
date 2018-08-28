package ochre

class Person {

    static auditable = true
    static constraints = {
        familyName()
        firstName()
        jobTitle()
        workAddress widget: 'textarea'
        telephoneNumber()
        emailAddress()
    }

    String familyName
    String firstName
    String jobTitle
    String workAddress
    String telephoneNumber
    String emailAddress

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${firstName} ${familyName}";
    }
}
