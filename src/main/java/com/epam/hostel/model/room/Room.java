package com.epam.hostel.model.room;


import com.epam.hostel.model.entity.Entity;

import java.math.BigDecimal;

public class Room extends Entity {
    private byte roomNumber;
    private byte roomPlaces;
    private BigDecimal price;
    private RoomStatus roomStatus;

    public byte getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(byte roomNumber) {
        this.roomNumber = roomNumber;
    }

    public byte getRoomPlaces() {
        return roomPlaces;
    }

    public void setRoomPlaces(byte roomPlaces) {
        this.roomPlaces = roomPlaces;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public RoomStatus getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(RoomStatus roomStatus) {
        this.roomStatus = roomStatus;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomNumber=" + roomNumber +
                ", roomPlaces=" + roomPlaces +
                ", price=" + price +
                ", roomStatus=" + roomStatus +
                '}';
    }
}
