package ochre

class CopyOfMTAOrCTA {

    static mapping = {
        copy type: "text"
    }
    static belongsTo = [mTAOrCTA:MTAOrCTA]
    static constraints = {
        mTAOrCTA()
        copy()
    }
    String copy
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${copy}";
    }
}
