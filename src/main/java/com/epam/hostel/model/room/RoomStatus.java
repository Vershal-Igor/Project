package com.epam.hostel.model.room;


public enum RoomStatus {
    FREE(0),
    BOOKED(1),
    TAKEN(2);

    private int id;

    private RoomStatus(int id) {
        this.id = id;
    }

    public static RoomStatus valueOf(int id) {
        for(RoomStatus s : values()) {
            if (s.id == id) {
                return s;
            }
        }
        throw new IllegalArgumentException(
                "No enum constant " + RoomStatus.class.getCanonicalName() + " with id:" + id);
    }
}
