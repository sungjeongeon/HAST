package com.cst.hast.dto.response;

import com.cst.hast.dto.Article;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
public class UpdateArticleResponse {

    private String korKeyword;
    private String engKeyword;
    private String url;
    private String timeStamp;

    public static UpdateArticleResponse fromArticle(Article article) {
        return new UpdateArticleResponse(
                article.getKorKeyword(),
                article.getEngKeyword(),
                article.getUrl(),
                article.getTimeStamp()
        );
    }

}
