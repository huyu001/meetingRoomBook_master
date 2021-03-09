package com.zhku.meeting.entities;

public class Room {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meeting_room.room_id
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    private Integer roomId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meeting_room.room_no
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    private String roomNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meeting_room.room_size
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    private Integer roomSize;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column meeting_room.room_status
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    private Boolean roomStatus;

    private Boolean tempStatus;

    private Boolean air;
    private Boolean projector;

    public Boolean getAir() {
        return air;
    }

    public void setAir(Boolean air) {
        this.air = air;
    }

    public Boolean getProjector() {
        return projector;
    }

    public void setProjector(Boolean projector) {
        this.projector = projector;
    }

    public Boolean getTempStatus() {
        return tempStatus;
    }

    public void setTempStatus(Boolean tempStatus) {
        this.tempStatus = tempStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meeting_room.room_id
     *
     * @return the value of meeting_room.room_id
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public Integer getRoomId() {
        return roomId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meeting_room.room_id
     *
     * @param roomId the value for meeting_room.room_id
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meeting_room.room_no
     *
     * @return the value of meeting_room.room_no
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public String getRoomNo() {
        return roomNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meeting_room.room_no
     *
     * @param roomNo the value for meeting_room.room_no
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo == null ? null : roomNo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meeting_room.room_size
     *
     * @return the value of meeting_room.room_size
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public Integer getRoomSize() {
        return roomSize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meeting_room.room_size
     *
     * @param roomSize the value for meeting_room.room_size
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public void setRoomSize(Integer roomSize) {
        this.roomSize = roomSize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column meeting_room.room_status
     *
     * @return the value of meeting_room.room_status
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public Boolean getRoomStatus() {
        return roomStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column meeting_room.room_status
     *
     * @param roomStatus the value for meeting_room.room_status
     *
     * @mbg.generated Thu Jun 11 23:28:47 CST 2020
     */
    public void setRoomStatus(Boolean roomStatus) {
        this.roomStatus = roomStatus;
    }

    public Room() {
    }

    public Room(String roomNo, Integer roomSize, Boolean roomStatus) {
        this.roomNo = roomNo;
        this.roomSize = roomSize;
        this.roomStatus = roomStatus;
    }
}