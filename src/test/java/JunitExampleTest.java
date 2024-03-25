import org.junit.Test;
import org.junit.platform.commons.annotation.Testable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@SpringBootTest
@AutoConfigureMockMvc
public class JunitExampleTest {

    @Autowired
    public static MockMvc mockMvc;

    @Test
    public void testUserLoginValidation_ValidCredentials_RedirectToHome() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/userloginvalidate")
                .param("username", "admin")
                .param("password", "123")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
                .andExpect(MockMvcResultMatchers.redirectedUrl("/home"));
    }

    @Test
    public void testUserLoginValidation_InvalidCredentials_ReturnsLoginPageWithError() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/userloginvalidate")
                .param("username", "admin")
                .param("password", "1234")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.view().name("yourLoginPageName"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("message"));
    }
}
