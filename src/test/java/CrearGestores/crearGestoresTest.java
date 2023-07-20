package CrearGestores;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class crearGestoresTest {

    @Test
    void testParallel() {
        Results results = Runner.path().relativeTo(getClass())
                //no depender del nombre del archivo, puedo correr las pruebas que estan en los .feature
                //.outputCucumberJson(true)
                .parallel(1);// numero de peticiones
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
