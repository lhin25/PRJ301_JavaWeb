/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author hien
 */
public class User {
    private String usId;
    private String usName;
    private int role;
    private String password;
    private String mail;
    private String phone;
    private String address;
    private LocalDate signupDate;

    public User() {
    }

    public User(String usId, String usName, int role, String password, String mail, String phone, String address, LocalDate signupDate) {
        this.usId = usId;
        this.usName = usName;
        this.role = role;
        this.password = password;
        this.mail = mail;
        this.phone = phone;
        this.address = address;
        this.signupDate = signupDate;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setUsId(String usId) {
        this.usId = usId;
    }

    public void setUsName(String usName) {
        this.usName = usName;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setSignupDate(LocalDate signupDate) {
        this.signupDate = signupDate;
    }

    public String getUsId() {
        return usId;
    }

    public String getUsName() {
        return usName;
    }

    public int getRole() {
        return role;
    }

    public String getPassword() {
        return password;
    }

    public String getMail() {
        return mail;
    }

    public String getPhone() {
        return phone;
    }

    public LocalDate getSignupDate() {
        return signupDate;
    }
}
