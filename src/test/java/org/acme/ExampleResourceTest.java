package org.acme;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ExampleResourceTest {

    @Test
    public void testHelloEndpoint() {
        String expected = "hello 2";
        ExampleResource exampleResource = new ExampleResource();
        Assertions.assertEquals(expected, exampleResource.hello());
    }

}