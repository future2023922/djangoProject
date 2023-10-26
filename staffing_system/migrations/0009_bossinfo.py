# Generated by Django 3.2.9 on 2023-05-21 13:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('staffing_system', '0008_alter_userinfo_password'),
    ]

    operations = [
        migrations.CreateModel(
            name='BossInfo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32, verbose_name='姓名')),
                ('age', models.IntegerField(verbose_name='年龄')),
                ('img', models.CharField(max_length=128, verbose_name='头像路径')),
            ],
        ),
    ]