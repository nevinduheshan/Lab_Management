package com.lab.labManage.dto;

public enum RoleEnum {

    SELECT(1,"select"),
    ADMIN(2, "admin"),
    PATIENT(3, "patient"),
    GUEST(4, "guest"),
    DOCTOR(5, "doctor"),
    PHYSIOTHERAPY(6,"Physiotherapy");


    private final int number;
    private final String value;

    RoleEnum(int number, String value) {
        this.number = number;
        this.value = value;
    }

    public int getNumber() {
        return number;
    }

    public String getValue() {
        return value;
    }


    public static RoleEnum findByNumber(int number) {
        for (RoleEnum role : values()) {
            if (role.getNumber() == number) {
                return role;
            }
        }
        return null;
    }

}
