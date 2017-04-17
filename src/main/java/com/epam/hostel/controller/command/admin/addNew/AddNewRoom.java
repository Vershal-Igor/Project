package com.epam.hostel.controller.command.admin.addNew;

import com.epam.hostel.model.room.Room;
import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.RoomServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;

@Controller
public class AddNewRoom {
    @Autowired
    private RoomServiceImpl roomService;

    @RequestMapping(value = "/add-room")
    public String addRoom(@RequestParam("roomNumber") Byte roomNumber, @RequestParam("roomPlaces") Byte roomPlaces,
                          @RequestParam("price") BigDecimal price) throws ServiceException {
        Room room = new Room();

        room.setRoomNumber(roomNumber);
        room.setRoomPlaces(roomPlaces);
        room.setPrice(price);

        roomService.add(room);

        return "redirect:/admin-rooms";
    }
}
