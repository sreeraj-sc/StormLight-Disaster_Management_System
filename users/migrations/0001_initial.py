# Generated by Django 5.0.1 on 2024-03-27 09:27

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='assign_request',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uid', models.CharField(max_length=150)),
                ('e_uid', models.CharField(max_length=150)),
                ('date', models.CharField(max_length=150)),
                ('volunteer', models.CharField(max_length=150)),
                ('req_id', models.CharField(max_length=150)),
                ('issue', models.CharField(max_length=150)),
                ('location', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('status', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='camps',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('date', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('place', models.CharField(max_length=150)),
                ('map', models.CharField(max_length=1000)),
            ],
        ),
        migrations.CreateModel(
            name='chats',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cus_id', models.CharField(max_length=150)),
                ('admin', models.CharField(max_length=150)),
                ('cus_msg', models.CharField(max_length=150)),
                ('admin_msg', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='donations',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('typee', models.CharField(max_length=150)),
                ('quantity', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('place', models.CharField(max_length=150)),
                ('uid', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='emc_servicerequest',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uid', models.CharField(max_length=150)),
                ('e_uid', models.CharField(max_length=150)),
                ('location', models.CharField(max_length=150)),
                ('maplink', models.CharField(max_length=150)),
                ('intensity', models.CharField(max_length=150)),
                ('image', models.CharField(blank=True, max_length=150, null=True)),
                ('message', models.CharField(max_length=150)),
                ('service', models.CharField(max_length=150)),
                ('status', models.CharField(max_length=150)),
                ('category', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='emergency',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('password', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='hospitals',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('place', models.CharField(max_length=150)),
                ('map', models.CharField(max_length=1000)),
            ],
        ),
        migrations.CreateModel(
            name='servicerequest',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uid', models.CharField(max_length=150)),
                ('e_uid', models.CharField(max_length=150)),
                ('service', models.CharField(max_length=150)),
                ('location', models.CharField(max_length=150)),
                ('state', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('date', models.CharField(max_length=150)),
                ('message', models.CharField(max_length=150)),
                ('status', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='services',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='userregg',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('email', models.CharField(max_length=150)),
                ('address', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('password', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='volregg',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
                ('email', models.CharField(max_length=150)),
                ('address', models.CharField(max_length=150)),
                ('state', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('age', models.CharField(max_length=150)),
                ('gender', models.CharField(max_length=150)),
                ('service', models.CharField(max_length=150)),
                ('password', models.CharField(max_length=150)),
            ],
        ),
    ]
