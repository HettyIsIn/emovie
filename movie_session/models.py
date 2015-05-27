# -*- coding: utf-8  -*-
#!/usr/local/bin/python

from django.db import models
from movie.models import Movie
from cm.models import CmArea
from cinema.models import Cinema, CinemaHall


MOVIE_SHOW_TYPE_CHOICES = (
    (0, '2D'),
    (1, '3D'),
    (2, '4D'),
    (3, 'IMAX'),
    (4, '其他')
)


class MovieSession(models.Model):
    movie = models.ForeignKey(Movie)
    city = models.ForeignKey(CmArea)
    cinema = models.ForeignKey(Cinema)
    hall = models.ForeignKey(CinemaHall)
    hall_name = models.CharField('影厅名称', max_length=100)

    show_type = models.IntegerField('电影维度', choices=MOVIE_SHOW_TYPE_CHOICES, default=4)
    language = models.CharField('语言版本', max_length=10, blank=True)

    show_date = models.DateField('上映日期')
    show_time = models.TimeField('上映时间')

    price = models.FloatField('影院门市价')

    out_id = models.CharField('时光网排场的id', max_length=50, unique=True)

    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'movie_session'
        verbose_name = '排场信息'
        verbose_name_plural = verbose_name
        unique_together = ("hall", "show_date", "show_time")
