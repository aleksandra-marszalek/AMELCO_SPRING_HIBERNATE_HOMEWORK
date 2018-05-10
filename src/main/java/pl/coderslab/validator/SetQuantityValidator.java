package pl.coderslab.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class SetQuantityValidator implements ConstraintValidator<SetQuantity, Integer> {
    private int value;

    @Override
    public void initialize(SetQuantity setQuantity) {
        this.value = setQuantity.value();

    }

    @Override
    public boolean isValid(Integer i, ConstraintValidatorContext constraintValidatorContext) {
        return i<value;
    }
}
