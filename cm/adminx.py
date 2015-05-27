# -*- coding: utf-8  -*-
#!/usr/local/bin/python
from cinema.models import Cinema
from movie.models import Movie
from movie_session.models import MovieSession

from xadmin import site
from xadmin import views
from models import CmArea


class CmAreaAdmin(object):
    """影视资讯的后台管理"""
    list_display = ("id", "name", "zy_id", "citycode", "level", "sell_ticket", "is_valid")
    list_display_links = ("name", )
    list_filter = ("level", "sell_ticket")
    search_fields = ("name", "zy_id",)


site.register(CmArea, CmAreaAdmin)



class MainDashboard(object):
    widgets = [
        [
            {
                "type": "html", "title": u"欢迎进入在线管理系统",
                "content": "<h3>Good morning, princess. </h3><p>Get busy living, or get busy dying.</p>"
            },
        ]
    ]


site.register(views.IndexView, MainDashboard)


class BaseSetting(object):
    enable_themes = False
    use_bootswatch = True


site.register(views.BaseAdminView, BaseSetting)


class GlobalSetting(object):
    global_models_icon = {
        CmArea: 'fa fa-map-marker',
        Cinema: 'fa fa-video-camera',
        Movie: 'fa fa-film',
        MovieSession: 'fa fa-calendar',
    }

    apps_label_title = {
        'cm': u'8城市城区',
        'cinema': u'1影院信息',
        'movie': u'0电影信息',
        'movie_session': u'2影片排期',
    }

    site_title = u'影易管理后台'
    site_footer = u"Copyright © 2015 影易 "
    menu_template = 'xadmin/includes/sitemenu_accordion.html'


site.register(views.CommAdminView, GlobalSetting)
