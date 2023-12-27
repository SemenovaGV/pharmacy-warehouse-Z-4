package entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Base64;

@Data
@Entity
@Table(name = "item")
public class Item {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private Long id;
    @Basic
    @Column(name = "category_id", nullable = false)
    private Long categoryId;
    @Basic
    @Column(name = "code")
    private String code;
    @Basic
    @Column(name = "name", nullable = false, length = 100)
    private String name;
    @Basic
    @Column(name = "manufacturer", length = 100)
    private String manufacturer;
    @Basic
    @Column(name = "price", nullable = false, precision = 2)
    private BigDecimal price;
    @Basic
    @Column(name = "count", nullable = false)
    private Long count;
    @Basic
    @Column(name = "image")
    private byte[] image;
    @Basic
    @Column(name = "description", length = -1)
    private String description;
    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "id", insertable=false, updatable=false)
    private Category categoryByCategoryId;
    @Transient
    private String base64Image;

    public String getBase64Image() {
        base64Image = Base64.getEncoder().encodeToString(this.image);
        return base64Image;
    }

    public String getDescription() {
        return description.replaceAll("\n", "<br/>");
    }

}
