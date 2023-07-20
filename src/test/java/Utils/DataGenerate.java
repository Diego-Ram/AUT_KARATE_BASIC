package Utils;
import net.datafaker.Faker;

import java.util.Locale;

public class DataGenerate {


    public static String name() {
        Faker faker = new Faker();
        return faker.name().firstName();
    }

    public static String job(){
        Faker faker = new Faker();
        return faker.job().title();
    }

}
