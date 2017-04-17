package com.epam.hostel.service.validator;


public interface Validator<E> {

    boolean validate(E entity);
}
