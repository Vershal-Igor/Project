package com.epam.hostel.service.validator.impl;


import com.epam.hostel.model.room.Room;
import com.epam.hostel.service.validator.Validator;


public class RoomValidator implements Validator<Room> {
    private static final int LOWER_LIMIT = 0;

    private RoomValidator() {}

    private static class SingletonHolder {
        private static final RoomValidator INSTANCE = new RoomValidator();
    }

    public static RoomValidator getInstance() {
        return SingletonHolder.INSTANCE;
    }


    @Override
    public boolean validate(Room room) {
        return room.getRoomNumber() > LOWER_LIMIT;
    }
}
