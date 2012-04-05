/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.domain;

import ohtu.radioaine.service.SubstanceService;
import org.junit.* ;
import static org.junit.Assert.* ;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 *
 * @author jahyvone
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context-test.xml"})
public class SubstanceTest {

    @Autowired
    private SubstanceService substanceService;
    
    public SubstanceTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void firstTest() {
       
        Assert.assertEquals(true, true);
        
        Substance substance = new Substance();
        substance.setName("testinimi");
        substance.setType(1);
        assertTrue(substance.getName().equals("testinimi"));
        substance = (Substance) substanceService.createOrUpdate(substance);
        assertTrue(substance.getName().equals("testinimi"));
    }

}
