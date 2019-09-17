package ochre

class NewJob {
    static triggers = {
      simple repeatInterval: 18000000 // execute job once in 5 hours
    }

    def execute() {
        // execute job
        def random = Math.abs(new Random().nextInt() % 10000 + 1)
        ApplicationForm.findById(random)
    }
}
