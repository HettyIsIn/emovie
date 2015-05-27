# -*- coding: utf-8  -*-
#!/usr/local/bin/python

from django.db import models
from cm.models import CmArea
from constants import *


class Cinema(models.Model):
    name = models.CharField('影院名称', max_length=200)
    address = models.CharField('影院地址', max_length=400, help_text='格式为北京市朝阳区...')
    longitude = models.DecimalField('经度坐标', max_digits=12, decimal_places=6)
    latitude = models.DecimalField('纬度坐标', max_digits=12, decimal_places=6)
    telephone = models.CharField('联系电话', max_length=100, blank=True, help_text="多个电话用 '|' 符号间隔 ")
    hall_count = models.IntegerField('影厅个数')
    desc = models.TextField('影院描述')
    road_line = models.CharField('乘车路线', max_length=400, help_text='普通文字形式')

    tradearea_id = models.IntegerField('商圈ID', default=-1)
    subway_id = models.IntegerField('地铁ID', default=-1)

    zy_sell_flag = models.IntegerField('售票标志', choices=ZY_SELL_CHOICES, default=0)
    zy_score = models.FloatField('评分', help_text='中影的评分', default=0)

    city = models.ForeignKey(CmArea)
    district_id = models.IntegerField('区域ID', db_index=True)

    zy_id = models.CharField('zy该影院的id', max_length=50, unique=True)
    is_valid = models.BooleanField('是否有效', default=True)

    cinema_logo = models.CharField('zy影院logo图片地址', max_length=500)
    inner_cinema_logo = models.CharField('内部的影院logo图片地址', max_length=500)
    recommend = models.BooleanField('是否推荐', default=0, help_text='是否在首页显示', db_index=True)

    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'cinema'
        verbose_name = '影院表'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return 'ID:%s-%s' % (self.id, self.name)


class CinemaFeature(models.Model):
    cinema = models.ForeignKey(Cinema)
    feature_id = models.IntegerField('特色ID', choices=ZY_CINEMA_SERVICES)
    feature_type = models.IntegerField('特色类型', choices=CINEMA_FEATURE_TYPE, default=0, help_text="0是自带， 1是合作的")
    desc = models.CharField('描述', max_length=200, blank=True)
    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'cinema_features'
        verbose_name = '影院特色表'
        verbose_name_plural = verbose_name
        unique_together = ('feature_type', 'feature_id', 'cinema')


class CinemaImages(models.Model):
    cinema = models.ForeignKey(Cinema)
    image_uri = models.CharField('影院图片地址', max_length=500)
    image_uri_md5 = models.CharField('uri的md5', max_length=35, unique=True)
    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'cinema_images'
        verbose_name = '影院图片表'
        verbose_name_plural = verbose_name


class CinemaHall(models.Model):
    city = models.ForeignKey(CmArea)
    cinema = models.ForeignKey(Cinema)
    name = models.CharField('影厅名称', max_length=100)

    zy_id = models.CharField('zy该影厅的唯一id', max_length=50, unique=True)
    is_valid = models.BooleanField('是否有效', default=False)

    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'cinema_hall'
        verbose_name = '影院影厅表'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "ID:%s-%s" % (self.id, self.name)

