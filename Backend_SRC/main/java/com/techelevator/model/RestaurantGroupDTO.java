package com.techelevator.model;

import java.util.List;

/**
 * For use after presentation
 */
public class RestaurantGroupDTO {

    private int restaurantId;
    private int groupId;
    private int memberId;
    private int userVote;
    private GroupMembers groupMembers;
    private RestaurantGroup restaurantGroups;

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getUserVote() {
        return userVote;
    }

    public void setUserVote(int userVote) {
        this.userVote = userVote;
    }

    public GroupMembers getGroupMembers() {
        return groupMembers;
    }

    public void setGroupMembers(GroupMembers groupMembers) {
        this.groupMembers = groupMembers;
    }

    public RestaurantGroup getRestaurantGroups() {
        return restaurantGroups;
    }

    public void setRestaurantGroups(RestaurantGroup restaurantGroups) {
        this.restaurantGroups = restaurantGroups;
    }
}
