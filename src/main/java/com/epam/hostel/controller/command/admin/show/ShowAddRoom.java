package com.epam.hostel.controller.command.admin.show;

import com.epam.hostel.model.room.Room;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ShowAddRoom {

    private static final String ADD_ROOM_PAGE = "admin/addNewRoom";

    @RequestMapping(value = "/show-add-room")
    public ModelAndView addRoom(@ModelAttribute("roomJSP") Room room) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(ADD_ROOM_PAGE);
        modelAndView.addObject("roomJSP", room);

        return modelAndView;
    }
}
