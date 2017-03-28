package com.acne.model;

import java.io.Serializable;
import java.util.Date;

public class AcneUser implements Serializable {
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.userId
	 *
	 * @mbggenerated
	 */
	private Long userid;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.username
	 *
	 * @mbggenerated
	 */
	private String username;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.password
	 *
	 * @mbggenerated
	 */
	private String password;
	private String phone;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.registerDate
	 *
	 * @mbggenerated
	 */
	private Date registerdate;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.avatar
	 *
	 * @mbggenerated
	 */
	private String avatar;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.description
	 *
	 * @mbggenerated
	 */
	private String description;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.sex
	 *
	 * @mbggenerated
	 */
	private String sex;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.age
	 *
	 * @mbggenerated
	 */
	private Integer age;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.skinType
	 *
	 * @mbggenerated
	 */
	private String skintype;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.acneTimeSpan
	 *
	 * @mbggenerated
	 */
	private Integer acnetimespan;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.level
	 *
	 * @mbggenerated
	 */
	private Integer level;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database column t_acne_user.available
	 *
	 * @mbggenerated
	 */
	private Integer available;

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database table t_acne_user
	 *
	 * @mbggenerated
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.userId
	 *
	 * @return the value of t_acne_user.userId
	 *
	 * @mbggenerated
	 */
	public Long getUserid() {
		return userid;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.userId
	 *
	 * @param userid
	 *            the value for t_acne_user.userId
	 *
	 * @mbggenerated
	 */
	public void setUserid(Long userid) {
		this.userid = userid;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.username
	 *
	 * @return the value of t_acne_user.username
	 *
	 * @mbggenerated
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.username
	 *
	 * @param username
	 *            the value for t_acne_user.username
	 *
	 * @mbggenerated
	 */
	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.password
	 *
	 * @return the value of t_acne_user.password
	 *
	 * @mbggenerated
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.password
	 *
	 * @param password
	 *            the value for t_acne_user.password
	 *
	 * @mbggenerated
	 */
	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.registerDate
	 *
	 * @return the value of t_acne_user.registerDate
	 *
	 * @mbggenerated
	 */
	public Date getRegisterdate() {
		return registerdate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.registerDate
	 *
	 * @param registerdate
	 *            the value for t_acne_user.registerDate
	 *
	 * @mbggenerated
	 */
	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.avatar
	 *
	 * @return the value of t_acne_user.avatar
	 *
	 * @mbggenerated
	 */
	public String getAvatar() {
		return avatar;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.avatar
	 *
	 * @param avatar
	 *            the value for t_acne_user.avatar
	 *
	 * @mbggenerated
	 */
	public void setAvatar(String avatar) {
		this.avatar = avatar == null ? null : avatar.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.description
	 *
	 * @return the value of t_acne_user.description
	 *
	 * @mbggenerated
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.description
	 *
	 * @param description
	 *            the value for t_acne_user.description
	 *
	 * @mbggenerated
	 */
	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.sex
	 *
	 * @return the value of t_acne_user.sex
	 *
	 * @mbggenerated
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.sex
	 *
	 * @param sex
	 *            the value for t_acne_user.sex
	 *
	 * @mbggenerated
	 */
	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.age
	 *
	 * @return the value of t_acne_user.age
	 *
	 * @mbggenerated
	 */
	public Integer getAge() {
		return age;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.age
	 *
	 * @param age
	 *            the value for t_acne_user.age
	 *
	 * @mbggenerated
	 */
	public void setAge(Integer age) {
		this.age = age;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.skinType
	 *
	 * @return the value of t_acne_user.skinType
	 *
	 * @mbggenerated
	 */
	public String getSkintype() {
		return skintype;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.skinType
	 *
	 * @param skintype
	 *            the value for t_acne_user.skinType
	 *
	 * @mbggenerated
	 */
	public void setSkintype(String skintype) {
		this.skintype = skintype == null ? null : skintype.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.acneTimeSpan
	 *
	 * @return the value of t_acne_user.acneTimeSpan
	 *
	 * @mbggenerated
	 */
	public Integer getAcnetimespan() {
		return acnetimespan;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.acneTimeSpan
	 *
	 * @param acnetimespan
	 *            the value for t_acne_user.acneTimeSpan
	 *
	 * @mbggenerated
	 */
	public void setAcnetimespan(Integer acnetimespan) {
		this.acnetimespan = acnetimespan;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.level
	 *
	 * @return the value of t_acne_user.level
	 *
	 * @mbggenerated
	 */
	public Integer getLevel() {
		return level;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.level
	 *
	 * @param level
	 *            the value for t_acne_user.level
	 *
	 * @mbggenerated
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column t_acne_user.available
	 *
	 * @return the value of t_acne_user.available
	 *
	 * @mbggenerated
	 */
	public Integer getAvailable() {
		return available;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column t_acne_user.available
	 *
	 * @param available
	 *            the value for t_acne_user.available
	 *
	 * @mbggenerated
	 */
	public void setAvailable(Integer available) {
		this.available = available;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_acne_user
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
		AcneUser other = (AcneUser) that;
		return (this.getUserid() == null ? other.getUserid() == null : this.getUserid().equals(other.getUserid()))
				&& (this.getUsername() == null ? other.getUsername() == null
						: this.getUsername().equals(other.getUsername()))
				&& (this.getPassword() == null ? other.getPassword() == null
						: this.getPassword().equals(other.getPassword()))
				&& (this.getRegisterdate() == null ? other.getRegisterdate() == null
						: this.getRegisterdate().equals(other.getRegisterdate()))
				&& (this.getAvatar() == null ? other.getAvatar() == null : this.getAvatar().equals(other.getAvatar()))
				&& (this.getDescription() == null ? other.getDescription() == null
						: this.getDescription().equals(other.getDescription()))
				&& (this.getSex() == null ? other.getSex() == null : this.getSex().equals(other.getSex()))
				&& (this.getAge() == null ? other.getAge() == null : this.getAge().equals(other.getAge()))
				&& (this.getSkintype() == null ? other.getSkintype() == null
						: this.getSkintype().equals(other.getSkintype()))
				&& (this.getAcnetimespan() == null ? other.getAcnetimespan() == null
						: this.getAcnetimespan().equals(other.getAcnetimespan()))
				&& (this.getLevel() == null ? other.getLevel() == null : this.getLevel().equals(other.getLevel()))
				&& (this.getAvailable() == null ? other.getAvailable() == null
						: this.getAvailable().equals(other.getAvailable())
								&& (this.getPhone() == null ? other.getPhone() == null
										: this.getPhone().equals(other.getPhone())));
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_acne_user
	 *
	 * @mbggenerated
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getUserid() == null) ? 0 : getUserid().hashCode());
		result = prime * result + ((getUsername() == null) ? 0 : getUsername().hashCode());
		result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
		result = prime * result + ((getRegisterdate() == null) ? 0 : getRegisterdate().hashCode());
		result = prime * result + ((getAvatar() == null) ? 0 : getAvatar().hashCode());
		result = prime * result + ((getDescription() == null) ? 0 : getDescription().hashCode());
		result = prime * result + ((getSex() == null) ? 0 : getSex().hashCode());
		result = prime * result + ((getAge() == null) ? 0 : getAge().hashCode());
		result = prime * result + ((getSkintype() == null) ? 0 : getSkintype().hashCode());
		result = prime * result + ((getAcnetimespan() == null) ? 0 : getAcnetimespan().hashCode());
		result = prime * result + ((getLevel() == null) ? 0 : getLevel().hashCode());
		result = prime * result + ((getAvailable() == null) ? 0 : getAvailable().hashCode());
		result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
		return result;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_acne_user
	 *
	 * @mbggenerated
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", userid=").append(userid);
		sb.append(", username=").append(username);
		sb.append(", password=").append(password);
		sb.append(", phone=").append(phone);
		sb.append(", registerdate=").append(registerdate);
		sb.append(", avatar=").append(avatar);
		sb.append(", description=").append(description);
		sb.append(", sex=").append(sex);
		sb.append(", age=").append(age);
		sb.append(", skintype=").append(skintype);
		sb.append(", acnetimespan=").append(acnetimespan);
		sb.append(", level=").append(level);
		sb.append(", available=").append(available);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}
}