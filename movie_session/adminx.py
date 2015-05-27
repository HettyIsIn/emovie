# -*- coding: utf-8  -*-
#!/usr/local/bin/python
"""
电影排场管理页
__version__ = "1.0"
__license__ = "Copyright (c) 2015-2010"
__author__ = "madeling <lingnck@gmail.com>"
"""
from xadmin import site
from models import MovieSession


class MovieSessionAdmin(object):
    list_display = ("id", "show_date", "price", "show_time", "movie", "city",
                    "hall", "cinema")
    list_filter = ("movie__title", "cinema__name", "city__name", "hall__name")
    list_display_link = ("id", )
    search_fields = ("id", )

site.register(MovieSession, MovieSessionAdmin)