# -*- coding: utf-8  -*-
#!/usr/local/bin/python

from django.db import models


AREA_LEVEL_CHOICES = (
    (1, '省级'),
    (2, '市级'),
    (3, '区县级'),
)


"""
    配置信息：城市、区

    一些影院和活动信息是需要城市/区配置信息的,这块信息是存放在这里的
"""
class CmArea(models.Model):
    name = models.CharField('名称', max_length=100)
    center_longitude = models.DecimalField('中心点经度坐标', max_digits=12, decimal_places=6)
    center_latitude = models.DecimalField('中心点纬度坐标', max_digits=12, decimal_places=6)

    adcode = models.IntegerField('身份证前6位', default=0, unique=True)
    citycode = models.CharField('城市区号', max_length=10)
    pinyin = models.CharField('区域拼音', max_length=100)
    level = models.IntegerField('区域级别', choices=AREA_LEVEL_CHOICES, default=0)

    sell_ticket = models.BooleanField('是否开通售票业务', default=False)
    zy_id = models.IntegerField('中影区域id', max_length=10, default=0)
    is_valid = models.BooleanField('是否有效', default=False)

    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)
    
    class Meta:
        db_table = u'cm_area'
        verbose_name = "区域"
        verbose_name_plural = "区域"
        ordering = ("id", )

    def __unicode__(self):
        return self.name
