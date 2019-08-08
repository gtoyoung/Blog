package test.sample.entity;

import static com.mysema.query.types.PathMetadataFactory.*;

import com.mysema.query.types.path.*;

import com.mysema.query.types.PathMetadata;
import javax.annotation.Generated;
import com.mysema.query.types.Path;


/**
 * QTag is a Querydsl query type for Tag
 */
@Generated("com.mysema.query.codegen.EntitySerializer")
public class QTag extends EntityPathBase<Tag> {

    private static final long serialVersionUID = 1461087063L;

    public static final QTag tag = new QTag("tag");

    public final NumberPath<Integer> id = createNumber("id", Integer.class);

    public final StringPath name = createString("name");

    public final DateTimePath<java.util.Date> regDate = createDateTime("regDate", java.util.Date.class);

    public final DateTimePath<java.util.Date> updateDate = createDateTime("updateDate", java.util.Date.class);

    public final NumberPath<Integer> useCount = createNumber("useCount", Integer.class);

    public QTag(String variable) {
        super(Tag.class, forVariable(variable));
    }

    public QTag(Path<? extends Tag> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTag(PathMetadata<?> metadata) {
        super(Tag.class, metadata);
    }

}

