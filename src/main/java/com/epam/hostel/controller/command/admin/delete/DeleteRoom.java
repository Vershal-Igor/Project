package com.epam.hostel.controller.command.admin.delete;


import com.epam.hostel.model.room.Room;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.RoomServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
public class DeleteRoom {
    @Autowired
    private RoomServiceImpl roomService;

   /* @RequestMapping(value = "/room-delete")
    public String addRoom(@RequestParam("id") Long id) throws ServiceException{
        long roomId = Long.parseLong(String.valueOf(id));
        roomService.delete(roomId);
        List<Room> rooms = roomService.findAll();

        //ModelAndView modelAndView = new ModelAndView();
        //modelAndView.setViewName(ADD_ROOM_PAGE);
        //modelAndView.addObject("roomJSP", rooms);

        //return modelAndView;
        return "redirect:/admin-rooms";
    }*/
    @RequestMapping("/delete/{roomId}")
    public String deleteUser(@PathVariable("roomId") Long roomId) throws ServiceException {
        roomService.delete(roomId);
        roomService.findAll();

        return "redirect:/admin-rooms";
    }

}
