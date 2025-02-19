"""Django command to wait for the database to be available"""
import time
from psycopg2 import OperationalError as Psycopg2Error
from django.core.management.base import BaseCommand
from django.db.utils import OperationalError
"""error djanjo throws when database is not ready"""


class Command(BaseCommand):
    def handle(self, *args, **options):
        """Entrypoint for command."""
        self.stdout.write("waiting for database")
        db_up = False
        while db_up is False:
            try:
                self.check(databases=['default'])
                db_up = True
            except (Psycopg2Error, OperationalError):
                self.stdout.write('Database unavailable, waiting 1 second...')
                time.sleep(1)
        self.stdout.write(self.style.SUCCESS('database available!'))
