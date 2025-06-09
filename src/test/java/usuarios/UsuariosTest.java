package usuarios;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

public class UsuariosTest {
    // Grupo 1: GET y POST en paralelo
    @org.junit.jupiter.api.Test
    void grupo1() {
        Results results = Runner.path("classpath:usuarios/GET_usuario", "classpath:usuarios/POST_usuario")
                                .parallel(2);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    // Grupo 2: GET por ID y PUT en paralelo
    @org.junit.jupiter.api.Test
    void grupo2() {
        Results results = Runner.path("classpath:usuarios/GET_usuario_id", "classpath:usuarios/PUT_usuario")
                                .parallel(2);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    // Grupo 3: DELETE al final
    @Karate.Test
    Karate grupo3() {
        return Karate.run("DELETE_usuario").relativeTo(getClass());
    }
}
