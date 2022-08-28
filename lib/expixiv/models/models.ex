defmodule Expixiv.Models.UserImages do
  use TypedStruct

  typedstruct do
    @typedoc "A User's images."

    field(:medium, String.t())
  end
end

defmodule Expixiv.Models.User do
  use TypedStruct

  typedstruct do
    @typedoc "A Pixiv User."

    field(:id, Integer.t(), enforce: true)
    field(:name, String.t(), enforce: true)
    field(:account, String.t())
    field(:comment, String.t())
    field(:is_followed, boolean())
    field(:profile_image_urls, [Expixiv.Models.UserImages.t()])
  end
end

defmodule Expixiv.Models.Profile do
  use TypedStruct

  typedstruct do
    @typedoc "A user's profile."

    field(:webpage, any())
    field(:gender, String.t())
    field(:birth, String.t())
    field(:birth_day, String.t())
    field(:region, String.t())
    field(:address_id, Integer.t())
    field(:country_code, String.t())
    field(:job, String.t())
    field(:job_id, Integer.t())
    field(:total_follow_users, Integer.t())
    field(:total_mypixiv_users, Integer.t())
    field(:total_illusts, Integer.t())
    field(:total_manga, Integer.t())
    field(:total_novels, Integer.t())
    field(:total_illust_bookmarks_public, Integer.t())
    field(:total_illust_series, Integer.t())
    field(:total_novel_series, Integer.t())
    field(:background_image_url, String.t())
    field(:twitter_account, String.t())
    field(:twitter_url, String.t())
    field(:pawoo_url, String.t())
    field(:is_premium, boolean())
    field(:is_using_custom_profile_image, boolean())
  end
end

defmodule Expixiv.Models.Workspace do
  use TypedStruct

  typedstruct do
    @typedoc "A User's workspace (what equipment they use)."

    field(:pc, String.t())
    field(:monitor, String.t())
    field(:tool, String.t())
    field(:scanner, String.t())
    field(:tablet, String.t())
    field(:mouse, String.t())
    field(:printer, String.t())
    field(:desktop, String.t())
    field(:music, String.t())
    field(:desk, String.t())
    field(:chair, String.t())
    field(:comment, String.t())
    field(:workspace_image_url, String.t())
  end
end

defmodule Expixiv.Models.ProfilePublicity do
  use TypedStruct

  typedstruct do
    field(:gender, String.t())
    field(:region, String.t())
    field(:birth_day, String.t())
    field(:birth_year, String.t())
    field(:job, String.t())
    field(:pawoo, boolean())
  end
end

defmodule Expixiv.Models.Tag do
  use TypedStruct

  typedstruct do
    field(:job, String.t())
    field(:translated_name, String.t())
  end
end

defmodule Expixiv.Models.Images do
  use TypedStruct

  typedstruct do
    field(:square_medium, String.t())
    field(:medium, String.t())
    field(:large, String.t())
    field(:original, String.t())
  end
end

defmodule Expixiv.Models.MetaSinglePage do
  use TypedStruct

  typedstruct do
    field(:original_image_url, String.t())
  end
end

defmodule Expixiv.Models.MetaPage do
  use TypedStruct

  typedstruct do
    field(:image_urls, Expixiv.Models.Images.t())
  end
end

defmodule Expixiv.Models.Series do
  use TypedStruct

  typedstruct do
    field(:id, Integer.t())
    field(:title, String.t())
  end
end

defmodule Expixiv.Models.Illust do
  use TypedStruct

  alias Expixiv.Models

  typedstruct do
    field(:id, Integer.t())
    field(:title, String.t())
    field(:type, String.t())
    field(:image_urls, Models.Images.t())
    field(:caption, String.t())
    field(:restrict, Integer.t())
    field(:user, Models.User.t())
    field(:tags, [Models.Tag.t()])
    field(:tools, [String.t()])
    field(:create_data, String.t())
    field(:page_count, Integer.t())
    field(:width, Integer.t())
    field(:height, Integer.t())
    field(:sanity_level, Integer.t())
    field(:x_restrict, Integer.t())
    field(:series, Models.Series.t())
    field(:meta_single_page, Models.MetaSinglePage.t())
    field(:meta_pages, [Models.MetaPage.t()])
  end
end

defmodule Expixiv.Models.IllustResponse do
  use TypedStruct

  typedstruct do
    field(:illust, Expixiv.Models.Illust.t())
  end
end

defmodule Expixiv.Models.IllustsResponse do
  use TypedStruct

  typedstruct do
    field(:illusts, [Expixiv.Models.Illust.t()])
    field(:next_url, String.t())
  end
end

defmodule Expixiv.Models.Comment do
  use TypedStruct

  typedstruct do
    field(:id, Integer.t())
    field(:comment, String.t())
    field(:date, String.t())
    field(:user, Expixiv.Models.User.t())
    field(:has_replies, boolean())
    field(:parent_comment, Expixiv.Models.Comment.t())
  end
end

defmodule Expixiv.Models.IllustRecommend do
  use TypedStruct

  typedstruct do
    field(:illusts, [Expixiv.Models.Illust.t()])
    field(:ranking_illusts, [Expixiv.Models.Illust.t()])
    field(:contest_exists, boolean())
    field(:privacy_policy, any())
  end
end

defmodule Expixiv.Models.TrendTag do
  use TypedStruct

  typedstruct do
    field(:tag, String.t())
    field(:translated_name, String.t())
    field(:illust, Expixiv.Models.Illust.t())
  end
end

defmodule Expixiv.Models.BookmarkDetailTag do
  use TypedStruct

  typedstruct do
    field(:is_registered, boolean())
    field(:name, String.t())
  end
end

defmodule Expixiv.Models.BookmarkDetail do
  use TypedStruct

  typedstruct do
    field(:is_bookmarked, boolean())
    field(:tags, [Expixiv.Models.BookmarkDetailTag.t()])
    field(:restrict, String.t())
  end
end

defmodule Expixiv.Models.UserPreview do
  use TypedStruct

  typedstruct do
    field(:user, Expixiv.Models.User.t())
    field(:illusts, [Expixiv.Models.Illust.t()])
    field(:novels, [any()])
    field(:is_muted, boolean())
  end
end

defmodule Expixiv.Models.Frame do
  use TypedStruct

  typedstruct do
    field(:file, String.t())
    field(:delay, Integer.t())
  end
end

defmodule Expixiv.Models.Entry do
  use TypedStruct

  typedstruct do
    field(:id, String.t())
    field(:title, String.t())
    field(:pure_title, String.t())
    field(:catchphrase, String.t())
    field(:header, String.t())
    field(:body, String.t())
    field(:footer, String.t())
    field(:sidebar, String.t())
    field(:publish_date, Integer.t())
    field(:language, String.t())
    field(:pixivision_category_slug, String.t())
    field(:pixivision_subcategory_slug, String.t())
    field(:tags, [Expixiv.Models.Tag.t()])
    field(:article_url, String.t())
    field(:intro, String.t())
    field(:facebook_count, String.t())
    field(:twitter_count, String.t())
  end
end

defmodule Expixiv.Models.Body do
  use TypedStruct

  alias Expixiv.Models

  typedstruct do
    field(:id, String.t())
    field(:lang, String.t())
    field(:entry, Models.Entry.t())
    field(:tags, [Models.Tag.t()])
    field(:thumbnailUrl, String.t())
    field(:title, String.t())
    field(:publishDate, Integer.t())
    field(:category, String.t())
    field(:subCategory, String.t())
    field(:subCategoryLabel, String.t())
    field(:subCategoryIntroduction, String.t())
    field(:introduction, String.t())
    field(:footer, String.t())
  end
end

defmodule Expixiv.Models.URL do
  use TypedStruct

  typedstruct do
    field(:"1200x1200", String.t())
    field(:"768x1200", String.t())
    field(:ugoira600x600, String.t())
    field(:ugoira1920x1080, String.t())
  end
end

defmodule Expixiv.Models.BodyIllust do
  use TypedStruct

  typedstruct do
    field(:spotlight_article_id, Integer.t())
    field(:illust_id, Integer.t())
    field(:description, String.t())
    field(:language, String.t())
    field(:illust_user_id, String.t())
    field(:illust_title, String.t())
    field(:illust_ext, String.t())
    field(:illust_width, String.t())
    field(:illust_height, String.t())
    field(:illust_restrict, String.t())
    field(:illust_x_restrict, String.t())
    field(:illust_create_date, String.t())
    field(:illust_upload_date, String.t())
    field(:illust_server_id, String.t())
    field(:illust_hash, String.t())
    field(:illust_type, String.t())
    field(:illust_sanity_level, Integer.t())
    field(:illust_book_style, String.t())
    field(:illust_page_count, String.t())
    field(:illust_comment, String.t())
    field(:user_account, String.t())
    field(:user_name, String.t())
    field(:user_comment, String.t())
    field(:url, Expixiv.Models.URL.t())
    field(:ugoira_meta, any())
    field(:user_icon, String.t())
  end
end

defmodule Expixiv.Models.ShowcaseArticle do
  use TypedStruct

  typedstruct do
    field(:error, boolean())
    field(:message, String.t())
    field(:body, Expixiv.Models.Body.t())
  end
end

defmodule Expixiv.Models.RelatedArticle do
  use TypedStruct

  typedstruct do
    field(:id, String.t())
    field(:ja, map())
    field(:en, map())
    field(:zh, map())
    field(:zh_tw, map())
    field(:publish_date, Integer.t())
    field(:category, String.t())
    field(:pixivision_category_slug, String.t())
    field(:pixivision_subcategory_slug, String.t())
    field(:thumbnail, String.t())
    field(:thumbnail_illust_id, String.t())
    field(:has_body, String.t())
    field(:is_pr, String.t())
    field(:pr_client_name, String.t())
    field(:edit_status, String.t())
    field(:translation_status, String.t())
    field(:is_sample, String.t())
    field(:illusts, [any()])
    field(:novel_ids, [any()])
    field(:memo, String.t())
    field(:facebook_count, String.t())
    field(:tweet_count, String.t())
    field(:tweet_max_count, String.t())
    field(:tags, [any()])
    field(:tag_ids, any())
    field(:numbered_tags, [any()])
    field(:main_abtest_pattern_id, String.t())
    field(:advertisement_id, String.t())
  end
end

defmodule Expixiv.Models.PixivisionCategory do
  use TypedStruct

  typedstruct do
    field(:label, String.t())
    field(:introduction, String.t())
  end
end

defmodule Expixiv.Models.PixivisionSubcategory do
  use TypedStruct

  typedstruct do
    field(:label, String.t())
    field(:label_en, String.t())
    field(:title, String.t())
    field(:introduction, String.t())
    field(:image_url, String.t())
    field(:big_image_url, String.t())
  end
end
