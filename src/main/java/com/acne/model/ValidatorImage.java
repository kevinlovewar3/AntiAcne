package com.acne.model;

import java.io.Serializable;

public class ValidatorImage implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_validators.validatorId
     *
     * @mbggenerated
     */
    private Integer validatorid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_validators.validatorName
     *
     * @mbggenerated
     */
    private String validatorname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_validators.validatorValue
     *
     * @mbggenerated
     */
    private String validatorvalue;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_validators
     *
     * @mbggenerated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_validators.validatorId
     *
     * @return the value of t_validators.validatorId
     *
     * @mbggenerated
     */
    public Integer getValidatorid() {
        return validatorid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_validators.validatorId
     *
     * @param validatorid the value for t_validators.validatorId
     *
     * @mbggenerated
     */
    public void setValidatorid(Integer validatorid) {
        this.validatorid = validatorid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_validators.validatorName
     *
     * @return the value of t_validators.validatorName
     *
     * @mbggenerated
     */
    public String getValidatorname() {
        return validatorname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_validators.validatorName
     *
     * @param validatorname the value for t_validators.validatorName
     *
     * @mbggenerated
     */
    public void setValidatorname(String validatorname) {
        this.validatorname = validatorname == null ? null : validatorname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_validators.validatorValue
     *
     * @return the value of t_validators.validatorValue
     *
     * @mbggenerated
     */
    public String getValidatorvalue() {
        return validatorvalue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_validators.validatorValue
     *
     * @param validatorvalue the value for t_validators.validatorValue
     *
     * @mbggenerated
     */
    public void setValidatorvalue(String validatorvalue) {
        this.validatorvalue = validatorvalue == null ? null : validatorvalue.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_validators
     *
     * @mbggenerated
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        ValidatorImage other = (ValidatorImage) that;
        return (this.getValidatorid() == null ? other.getValidatorid() == null : this.getValidatorid().equals(other.getValidatorid()))
            && (this.getValidatorname() == null ? other.getValidatorname() == null : this.getValidatorname().equals(other.getValidatorname()))
            && (this.getValidatorvalue() == null ? other.getValidatorvalue() == null : this.getValidatorvalue().equals(other.getValidatorvalue()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_validators
     *
     * @mbggenerated
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getValidatorid() == null) ? 0 : getValidatorid().hashCode());
        result = prime * result + ((getValidatorname() == null) ? 0 : getValidatorname().hashCode());
        result = prime * result + ((getValidatorvalue() == null) ? 0 : getValidatorvalue().hashCode());
        return result;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_validators
     *
     * @mbggenerated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", validatorid=").append(validatorid);
        sb.append(", validatorname=").append(validatorname);
        sb.append(", validatorvalue=").append(validatorvalue);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}