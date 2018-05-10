package pl.coderslab.validator;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = SetQuantityValidator.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface SetQuantity {

    int value();

    String message() default "{pl.coderslab.validator.setQuantity.message}";

    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
