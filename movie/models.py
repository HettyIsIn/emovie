# -*- coding: utf-8  -*-
#!/usr/local/bin/python

from django.db import models
from movie.constants import GENDER_CHOICES, PEOPLE_ROLE_TYPE, MOVIE_SHOW_TYPE_CHOICES, SHOWTIME_CHOICES


class Movie(models.Model):
    title = models.CharField('影片名称', max_length=100)
    nickname = models.CharField('别名', max_length=100, blank=True, help_text="多个别名用'|'符号间隔 ")

    showtime = models.DateField('影片上映日期')
    small_vertical_photo = models.CharField('zy小的竖预告图', max_length=100)
    large_vertical_photo = models.CharField('zy大的竖预告图', max_length=100)
    horizontal_photo = models.CharField('zy横预告图', max_length=100)

    inner_small_vertical_photo = models.CharField('内部小的竖预告图', max_length=100)
    inner_large_vertical_photo = models.CharField('内部大的竖预告图', max_length=100)
    inner_horizontal_photo = models.CharField('内部横预告图', max_length=100)

    duration = models.IntegerField('片长', help_text='单位为分钟')
    score = models.DecimalField('评分', max_digits=3, decimal_places=1)
    desc = models.TextField('剧情', blank=True)
    language = models.CharField('语言', max_length=50)
    area = models.CharField('地区', max_length=50)
    company = models.CharField('公司', max_length=150)

    show_type = models.IntegerField('放映类型', choices=MOVIE_SHOW_TYPE_CHOICES, default=4)

    off_show_date = models.DateField('影片下映日期', blank=True)
    presale_start_date = models.DateField('预售开始时间', blank=True)
    presale_end_date = models.DateField('预售结束时间', blank=True)
    is_valid = models.BooleanField('是否下线', default=False)
    recommend = models.BooleanField('是否推荐', default=0, db_index=True)
    pub_status = models.BooleanField('是否定档', help_text='电影上映时间是否定档，未定档需要给用户提示', default=True)

    zy_id = models.IntegerField('zy该电影的id', max_length=5, default=0, unique=True)
    douban_id = models.IntegerField('豆瓣该电影的id', max_length=15, default=0)

    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    def __unicode__(self):
        return self.title

    class Meta:
        db_table = 'movie'
        verbose_name = '影片'
        verbose_name_plural = verbose_name


class MovieStills(models.Model):
    movie = models.ForeignKey(Movie)
    image_uri = models.CharField('zy的图片地址', max_length=500)
    image_uri_md5 = models.CharField('uri的md5', max_length=35, unique=True)
    inner_image_uri = models.CharField('内部转存的图片地址', max_length=500)
    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'movie_stills'
        verbose_name = '影片图片'
        verbose_name_plural = verbose_name


class MovieCategory(models.Model):
    movie = models.ForeignKey(Movie)
    category = models.CharField('电影类型', max_length=100)
    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'movie_category'
        verbose_name = '电影类型'
        verbose_name_plural = verbose_name
        unique_together = ('movie', 'category')


class MoviePeople(models.Model):
    name = models.CharField('中文名', max_length=100, unique=True)
    name_en = models.CharField('英文名', max_length=100)
    gender = models.IntegerField('性别', choices=GENDER_CHOICES, default=0)
    birthday = models.DateField('出生日期')
    born_place = models.CharField('出生地', max_length=100, blank=True)
    professions = models.CharField('职业', max_length=100, blank=True)
    constellation = models.CharField('星座', max_length=50, blank=True)

    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    def __unicode__(self):
        return self.name

    class Meta:
        db_table = 'movie_people'
        verbose_name = '电影从业人员'
        verbose_name_plural = verbose_name


class MoviePeopleRef(models.Model):
    people = models.ForeignKey(MoviePeople)
    movie = models.ForeignKey(Movie)
    profession_id = models.IntegerField('职业ID', choices=PEOPLE_ROLE_TYPE, default=0)
    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = 'movie_people_ref'
        verbose_name = '人员与作品关联'
        verbose_name_plural = verbose_name
        unique_together = ('movie', 'people', 'profession_id')


class MovieRemind(models.Model):
    movie = models.ForeignKey(Movie)
    user_id = models.IntegerField('用户ID', db_index=True)
    title = models.CharField('影片名称', max_length=100)
    showtime = models.DateTimeField('上映时间')
    showtime_type = models.BooleanField('上映时间类型', help_text="影片超前预售的时间或是上映时间",
                                        choices=SHOWTIME_CHOICES, default=0)
    createtime = models.DateTimeField('创建时间', auto_now_add=True)
    updatetime = models.DateTimeField('更新时间', auto_now=True)

    class Meta:
        db_table = u'movie_remind'
        verbose_name = '影片上线提醒表'
        verbose_name_plural = verbose_name
        index_together = ['movie', 'user_id']
