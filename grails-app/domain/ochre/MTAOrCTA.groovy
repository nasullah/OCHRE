package ochre

class MTAOrCTA {

    static hasMany = [copyOfMTAOrCTA:CopyOfMTAOrCTA]
    static constraints = {
        mTAOrCTAPending(nullable: true)
        mTAOrCTAComplete(nullable: true)
    }

    boolean mTAOrCTAPending = Boolean.FALSE
    boolean mTAOrCTAComplete = Boolean.FALSE

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${mTAOrCTAPending}";
    }
}
