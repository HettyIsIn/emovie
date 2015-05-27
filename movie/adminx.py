# -*- coding: utf-8  -*-
#!/usr/local/bin/python

from xadmin import site
from models import Movie, MoviePeople, MovieCategory, MovieStills, MovieRemind, MoviePeopleRef


class MovieAdmin(object):
    list_display = ("id", "title", "nickname", "photo", "showtime", "off_show_date", "presale_start_date",
                    "presale_end_date", "duration", "recommend", "zy_id", "douban_id")
    list_display_links = ("title", )
    list_filter = ("recommend", )
    search_fields = ("title", "nickname", "zy_id", "douban_id")

    def photo(self, obj):
        pic = '<img src="%s"; width="98px";/>' % obj.small_vertical_photo
        return pic

    photo.allow_tags = True
    photo.short_description = "电影图片"

site.register(Movie, MovieAdmin)


class MoviePeopleAdmin(object):
    list_display = ("id", "name", "name_en", "professions", "born_place", "gender")
    list_display_links = ("name", )
    list_filter = ("professions", )
    search_fields = ("name", "name_en")

site.register(MoviePeople, MoviePeopleAdmin)


class MovieStillsAdmin(object):
    list_display = ("id", "movie", "image", "image_uri_md5", "inner_image_uri")
    list_display_links = ("movie", )
    list_filter = ("movie__title", )
    list_per_page = 10

    def image(self, obj):
        pic = '<img src="%s"; width="98px";/>' % obj.image_uri
        return pic

    image.allow_tags = True
    image.short_description = "电影海报"

site.register(MovieStills, MovieStillsAdmin)


class MovieCategoryAdmin(object):
    list_display = ("id", "movie", "category")
    list_display_links = ("movie", )
    list_filter = ("movie__title", )

site.register(MovieCategory, MovieCategoryAdmin)


class MovieRemindAdmin(object):
    list_display = ("id", "movie", "user_id", "showtime_type")
    list_display_links = ("movie", )
    list_filter = ("movie__title", )

site.register(MovieRemind, MovieRemindAdmin)


class MoviePeopleRefAdmin(object):
    list_display = ("id", "movie", "people", "profession_id")
    list_display_links = ("movie", )
    list_filter = ("movie__title", "people__name")

site.register(MoviePeopleRef, MoviePeopleRefAdmin)


