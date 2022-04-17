package janus.cases;

import com.intuit.karate.junit5.Karate;

class CasesRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("cases").relativeTo(getClass());
    }    

}
