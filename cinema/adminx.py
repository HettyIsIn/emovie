# -*- coding: utf-8  -*-
#!/usr/local/bin/python

from xadmin import site
from models import Cinema, CinemaFeature, CinemaHall, CinemaImages


class CinemaAdmin(object):
    """影视资讯的后台管理"""
    list_display = ("id", "name", "address", "city", "zy_id", "recommend")
    list_display_links = ("name", )
    list_filter = ('city__name', 'recommend',)
    search_fields = ("name", "address",)


site.register(Cinema, CinemaAdmin)


class CinemaFeatureAdmin(object):
    list_display = ('id', 'feature_id', 'cinema', 'feature_type')
    list_display_links = ("feature_id", )
    list_filter = ('cinema__name', 'feature_id',)

site.register(CinemaFeature, CinemaFeatureAdmin)


class CinemaHallAdmin(object):
    list_display = ('id', 'name', 'city', 'cinema', 'zy_id')
    list_display_links = ("name", )
    list_filter = ('city__name', 'zy_id',)
    search_fields = ("name", "zy_id",)

site.register(CinemaHall, CinemaHallAdmin)


class CinemaImagesAdmin(object):
    list_display = ('id', 'cinema', 'image', 'image_uri_md5')
    list_display_links = ("cinema", )
    list_filter = ('cinema__name',)
    list_per_page = 10

    def image(self, obj):
        pic = '<img src="%s"; width="98px";/>' % obj.image_uri
        return pic

    image.allow_tags = True
    image.short_description = "影院图片"

site.register(CinemaImages, CinemaImagesAdmin)
